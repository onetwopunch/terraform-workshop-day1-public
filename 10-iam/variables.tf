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

variable "force_destroy" {
  description = "Allow deleting non-empty bucket on destroy."
  type        = bool
  default     = true
}

variable "iam_admins" {
  description = "List of IAM-style identities that will be assigned the storage admin role."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Bucket labels."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Bucket location, defaults to 'EU'."
  type        = string
  default     = "EU"
}

variable "names" {
  description = "Bucket names."
  type        = list(string)
  default     = ["one", "two"]
}

variable "prefix" {
  description = "Optional name prefix."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "Project where the bucket will be created."
  type        = string
}

variable "set_iam_admins" {
  description = "Set IAm bindings for the storage admin role."
  type        = bool
  default     = false
}

variable "storage_class" {
  description = "Bucket storage class, defaults to 'MULTI_REGIONAL'."
  type        = string
  default     = "MULTI_REGIONAL"
}
