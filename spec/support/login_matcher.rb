RSpec::Matchers.define :require_login_for do |*actions|
  match do 
    actions.each do |action|
      case action
      when :index, :new, :show, :edit
        get action
      when :create
        post action
      when :update
        put action
      when :destroy
        delete action
      end

      should redirect_to('/login')
    end
  end

  failure_message_for_should do
    "expected #{actions.inspect} actions to not be accessible without a session"
  end
end
