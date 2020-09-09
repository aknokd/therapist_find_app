class Qualification < ActiveHash::Base
  self.data = [
    { id: 0, name: '-----' },
    { id: 1, name: '柔道整復師' },
    { id: 2, name: '鍼灸師' },
    { id: 3, name: 'あん摩マッサージ指圧師' },
    { id: 4, name: '理学療法士' },
    { id: 5, name: '作業療法士' }
  ]
end