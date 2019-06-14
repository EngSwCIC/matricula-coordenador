module Login
    extend Capybara::DSL
    
    def self.as(email, senha)
        visit Rails.application.routes.url_helpers.new_user_session_path
        fill_in :user_email, with: email
        fill_in :user_password, with: senha
        click_button 'Log in'
    end
end