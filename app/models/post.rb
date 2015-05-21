require 'securerandom'
require 'digest/md5'

class Post < ActiveRecord::Base
   before_save :createSlug
   before_create :createIdentifier, only: :create
   attr_accessor :tags_list, :relative_url

   def self.getStatusOptions
      [
         ['Draft', 'draft'],
         ['Published', 'published'],
         ['Hidden', 'hidden'],
         ['Archived', 'archived']
      ]
   end

   def relative_url
      "/posts/#{self.identifier}-#{self.slug}"
   end

private
   def createSlug
      self.slug = self.title.parameterize
   end

   def createIdentifier
      self.identifier = Digest::MD5.hexdigest(SecureRandom.base64)[0..5]
   end
end
