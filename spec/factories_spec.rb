FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
     it 'should be valid' do
      expect(build(factory_name)).to be_valid
     end
  end
end
