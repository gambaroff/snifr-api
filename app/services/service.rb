class Service

  def self.call(*args)
    Rails.logger.tagged("Service::#{name}") do
      new(*args).call
    end
  end
end
