class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '体調' },
    { id: 2, name: '良い' },
    { id: 3, name: '普通' },
    { id: 4, name: '悪い' },
  ]