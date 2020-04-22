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
  prefix = var.prefix == "" ? random_pet.random[0].id : var.prefix
  names  = [for name in var.names : "${local.prefix}-${name}"]
}

resource "random_pet" "random" {
  count     = var.prefix == "" ? 1 : 0
  length    = 1
  separator = "-"
}

resource "google_storage_bucket" "bucket" {
  count              = length(var.names)
  project            = var.project_id
  name               = element(local.names, count.index)
  location           = var.location
  storage_class      = var.storage_class
  force_destroy      = var.force_destroy
  bucket_policy_only = true
  labels             = var.labels
}
