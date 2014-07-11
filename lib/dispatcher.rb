class Dispatcher
  def dispatch(hash)
    message(hash['message']) if hash['message']
    presence(hash['presence']) if hash['presence']
  end

  private

  def presence(presence)
    if presence['add']
      Group.create(uid: presence['from'])
    end
  end

  # notify && body => chat message
  def message(msg)
    if msg['notify'] && msg['body']
      from = msg['from']
      name = msg['notify']['name']
      group = Group.where(uid: from).first_or_create
      return unless group
      body = msg['body'][1..-1]
      group.messages.create(author: name, value: body)
    end
  end
end
