class Heat < ActiveHash::Base
  self.data = [
    { id: 1, name: '体温' },
    { id: 2, name: '35.5度' },
    { id: 3, name: '35.6度' },
    { id: 4, name: '35.7度' },
    { id: 5, name: '35.8度' },
    { id: 6, name: '35.9度' },
    { id: 7, name: '36.0度' },
    { id: 8, name: '36.1度' },
    { id: 9, name: '36.2度' },
    { id: 10, name: '36.3度' },
    { id: 11, name: '36.4度' },
    { id: 12, name: '36.5度' },
    { id: 13, name: '36.6度' },
    { id: 14, name: '36.7度' },
    { id: 15, name: '36.8度' },
    { id: 16, name: '36.9度' },
    { id: 17, name: '37.0度' },
    { id: 18, name: '37.1度' },
    { id: 19, name: '37.2度' },
    { id: 20, name: '37.3度' },
    { id: 21, name: '37.4度' },
    { id: 22, name: '37.5度以上' }
  ]

  include ActiveHash::Associations
  has_many :messages
end
