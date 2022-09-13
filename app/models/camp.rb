class Camp < ApplicationRecord
  enum camp_type: { virtual: 0, physical: 1, hybrid: 2 }
end
