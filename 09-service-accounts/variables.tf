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

variable "prefix" {
  description = "Optional name prefix."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "Project where the bucket will be created."
  type        = string
}

variable "names" {
  description = "Bucket names."
  type        = list(string)
  default     = ["one", "two"]
}

variable "location" {
  description = "Bucket location, defaults to 'EU'."
  type        = string
  default     = "EU"
}

variable "storage_class" {
  description = "Bucket storage class, defaults to 'MULTI_REGIONAL'."
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "labels" {
  description = "Bucket labels."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "Allow deleting non-empty bucket on destroy."
  type        = bool
  default     = true
}
