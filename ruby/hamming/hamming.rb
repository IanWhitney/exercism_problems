class Hamming
  def self.compute(a,b)
    a = a.split(//)
    b = b.split(//)
    max = (a.count < b.count) ? a.count : b.count
    a = a[0,max]
    b = b[0,max]
    y = a.zip(b)
    y.inject(0) {|ret, h| ret += 1 if h.first != h.last; ret}
  end
end
