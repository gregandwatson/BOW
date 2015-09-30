class ArticleDeletion
  attr_accessor :article
  
  def initialize(article)
    @article = article
  end
  
  def destroy
    if self.article.destroy
      self.article_deletion_notification
    end
  end
  
  def article_deletion_notification
    UserNotifier.notify_of_removal(@article.followers,@article).deliver(self.article)
  end
end