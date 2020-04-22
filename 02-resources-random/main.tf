/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the
);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an
 BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "random_pet" "random" {
  length    = 1
  separator = "-"
}

resource "google_storage_bucket" "bucket" {
  project            = "PROJECT_PLACEHOLDER"
  name               = "${random_pet.random.id}-bucket"
  location           = "EU"
  storage_class      = "MULTI_REGIONAL"
  force_destroy      = true
  bucket_policy_only = true
  labels = {
    usage = "terraform-workshop"
  }
}
