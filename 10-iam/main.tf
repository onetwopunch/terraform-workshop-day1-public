/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  sa_emails = {
    for name in var.names : name => module.service-accounts.iam_emails[name]
  }
  names = {
    for name in var.names : name => "${local.prefix}-${name}"
  }
  prefix = var.prefix == "" ? random_pet.random[0].id : var.prefix
}

module "service-accounts" {
  source          = "terraform-google-modules/service-accounts/google"
  version         = "2.0.2"
  project_id      = var.project_id
  prefix          = local.prefix
  names           = var.names
  generate_keys   = true
  grant_xpn_roles = false
}

resource "random_pet" "random" {
  count     = var.prefix == "" ? 1 : 0
  length    = 1
  separator = "-"
}

resource "google_storage_bucket" "bucket" {
  for_each           = toset(var.names)
  project            = var.project_id
  name               = local.names[each.value]
  location           = var.location
  storage_class      = var.storage_class
  force_destroy      = var.force_destroy
  bucket_policy_only = true
  labels             = var.labels
}

resource "google_storage_bucket_iam_binding" "admin" {
  for_each = var.set_iam_admins ? toset(var.names) : toset([])
  bucket   = local.names[each.value]
  role     = "roles/storage.admin"
  members = concat(
    var.iam_admins, [local.sa_emails[each.value]]
  )
}
