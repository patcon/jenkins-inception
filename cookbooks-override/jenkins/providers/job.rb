#
# Cookbook Name:: jenkins
# Based on hudson
# Provider:: job
#
# Author:: Doug MacEachern <dougm@vmware.com>
# Author:: Fletcher Nichol <fnichol@nichol.ca>
#
# Copyright:: 2010, VMware, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def job_url
  job_url = "#{@new_resource.url}/job/#{@new_resource.job_name}/config.xml"
  Chef::Log.debug "[jenkins_job] job_url: #{job_url}"
  job_url
end

def job_exists
  jenkins_cli "get-job #{@new_resource.job_name}" rescue false
  return true
end

def action_create
  unless job_exists
    jenkins_cli "create-job #{@new_resource.job_name} < #{@new_resource.config}"
  end
end

#there is no cli update-job command
def action_update
  if job_exists
    jenkins_cli "update-job #{@new_resource.job_name}  < #{@new_resource.config}"
  else
    action_create
  end
end

def action_delete
  jenkins_cli "delete-job #{@new_resource.job_name}"
end

def action_disable
  jenkins_cli "disable-job #{@new_resource.job_name}"
end

def action_enable
  jenkins_cli "enable-job #{@new_resource.job_name}"
end

def action_build
  jenkins_cli "build #{@new_resource.job_name}"
end
