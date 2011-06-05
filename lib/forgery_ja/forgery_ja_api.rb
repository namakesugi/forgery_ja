# coding: utf-8
def ForgeryJa(forgery, method=nil, *args)
  klass = "ForgeryJa::#{forgery.to_s.camelize}".constantize
  if method
    klass.send(method, *args)
  else
    klass
  end
end
