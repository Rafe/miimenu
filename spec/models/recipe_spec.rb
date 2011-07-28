require 'spec_helper'

describe Recipe do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: recipes
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :text
#  instructions       :text
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  user_id            :integer(4)
#  tags               :string(255)
#

