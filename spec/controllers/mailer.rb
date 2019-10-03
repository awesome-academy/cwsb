it 'sends a confirmation email' do
  user = FactoryGirl.build :user
  expect { user.save }.to change(ActionMailer::Base.deliveries, :count).by(1)
end
