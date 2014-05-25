class Hamming
  def self.compute(a,b)
    a = a.split(//)
    b = b.split(//)
    main = (a.count < b.count) ? [a,b] : [b,a]
    y = main[0].zip(main[1])
    y.inject(0) {|ret, h| ret += 1 if h.first != h.last; ret}
  end
end
