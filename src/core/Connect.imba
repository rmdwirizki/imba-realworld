import {ApiAgent} from './ApiAgent.imba'

# Private Function / Helper
const toQueryString = do |obj|
  const arr = Object.keys(obj).map do |i| 
    if (obj[i] === undefined || obj[i] === null)
      return ''
    return 
      window.encodeURIComponent(i) + '=' + 
      window.encodeURIComponent(obj[i])
  return arr.filter(do |str| return /\S/.test(str))
    .join('&')

class Connect
  prop api default: ApiAgent.new
  prop session default: {
    user: null
  }

  def checkAuth
    return (@session:user == null) ? false : true

  def setAuth user
    window:localStorage:_token = user:token
    @session:user = user
  
  def fetch key, query
    # Set Request Headers
    let headers = Headers.new;
    headers.append 'Content-type', 'application/json'

    const extra  = @api.endpoints[key][2]
    if extra && extra:auth
      headers.append 'Authorization', 'Token ' + window:localStorage:_token

    # Set Request Params
    const method = @api.endpoints[key][0]
    let url = @api.root + @api.endpoints[key][1]
    let params = { headers: headers, method : method }

    # Build url query
    if query
      if method == 'GET'
        url = url + '?' + toQueryString query
      elif method == 'POST'
        params:body = JSON.stringify(query)
    
    # Fetch request
    const res = await window.fetch url, params
    return res.json

export var Connect = Connect.new