[1,2,3,4,5].map{|a| p a*2}
p [1,2,3,4,5].select{|a| a.even? }
p [1,2,3,4].reject{|n| n.even? }
p [1, 2, 3, 4].reduce(:+)
p [1, 2, 3].reduce(10) { |sum, n| sum + n * 2 }
p [1, 2, 3, 4].inject(0) { |sum, n| sum + n }
p [1, 2, 3].inject(:+)
p [[:name, 'Alice'], [:age, 30]].inject({}) { |hash, (k, v)| hash[k] = v; hash }
p [1,2,3].any?(&:even?)
p [1,2,3].all? { |n| n > 0 }
p [1, 3, 5].none?(&:even?)
p [1, 2, 3].one?(&:even?)
p [1,3,5,2].detect(&:even?) # scanning until found
p (1..10).find(&:even?)
p (1..5).drop(2)
p (1..3).each_with_object({}) { |n,h| h[n] = n*2 }
p [:a,:b,:a].tally
p [1,2,3].sum
(1..10).each_slice(3) { |slice| p slice }
(1..5).each_cons(2) { |group| p group }
# [10,15,25].each_cons(2).map { |(prev,next)| p "#{next}-#{prev}" }
fruits = ['apple', 'pear', 'pear', 'banana', 'apple']; 
p fruits.count('apple')
p [18, 22, 33, nil, 5, 6].find_index(5)