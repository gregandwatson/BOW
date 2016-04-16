class Document < ActiveRecord::Base
  mount_uploader :document, DocumentUploader

  has_many :articles,
           :through => :article_documents
  has_many :article_documents

end
