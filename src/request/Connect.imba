import {Auth} from './Auth.imba'

import {ApiAgent} from './ApiAgent.imba'
import {toQueryString} from '../global/Helper.imba'

class Connect
  prop api default: ApiAgent.new

  # Key         : Index Key in that represent an endpoint
  # Query (GET) : Query String Parameters 
  # Query (POST): Request Payload
  # Params      : URL overwrite mapping object

  def fetch key, query, params=null
    # Set Request Headers
    const extra = @api.endpoints[key][2]
    let headers = Headers.new
    headers.append 'Content-type', 'application/json'
    if extra && (extra:auth === 'required' || (Auth.check && extra:auth === 'optional'))
      headers.append 'Authorization', 'Token ' + window:localStorage:_token

    # Set Request Payload
    const method = @api.endpoints[key][0]
    let payload = { headers: headers, method : method }
    if query && method != 'GET'
      payload:body = JSON.stringify query

    # Mapping URL params, ex: /profile/:username
    let endpoint = @api.endpoints[key][1]
    if params
      let arr = endpoint.split '/'
      endpoint = arr.map(do |item| return params[item.replace ':', ''] || item).join '/'
    let url = @api.root + endpoint

    # Set Query String Parameters
    if query && method == 'GET'
      url = url + '?' + toQueryString query
    
    # Fetch request
    const res = await window.fetch url, payload
    
    try 
      return await res.json
    catch e 
      return res

export var Connect = Connect.new