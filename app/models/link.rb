class Link < ApplicationRecord
    belongs_to :course
    #validates :link_url, url: { allow_nil: true }
    URL_REGEXP = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    validates :link_url, format: { with: URL_REGEXP, message: 'You provided invalid URL', :multiline => true}
end
