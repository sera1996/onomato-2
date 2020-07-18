class Favor < ApplicationRecord
    belongs_to :survey
    enum dimension_name: {aadhesive: 0, bfriction: 1, cemboss: 2, dfavor: 3, eelastic: 4, fwetness: 5, ghardness: 6}
end
