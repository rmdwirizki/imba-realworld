# Transform Object to Query String
# Example: {a: 1, b: 2} to 'a=1&b=2'
export var toQueryString = do |obj|
  const arr = Object.keys(obj).map do |i| 
    if (obj[i] === undefined || obj[i] === null)
      return ''
    return 
      window.encodeURIComponent(i) + '=' + 
      window.encodeURIComponent(obj[i])
  return arr.filter(do |str| return /\S/.test(str)).join('&')