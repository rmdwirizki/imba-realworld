export class ApiAgent
  prop root default:'https://conduit.productionready.io/api'
  prop endpoints default: {
    'LIST_ARTICLES' : ['GET',  '/articles', { auth: 'optional' }],
    'FEED_ARTICLES' : ['GET',  '/articles/feed', { auth: 'required' }],
    'CREATE_ARTICLE': ['POST', '/articles', { auth: 'required' }],
    'LIST_TAGS'     : ['GET',  '/tags'],
    'REGISTER_USER' : ['POST', '/users'],
    'LOGIN_USER'    : ['POST', '/users/login'],
    'CURRENT_USER'  : ['GET',  '/user', { auth: 'required' }],
    'UPDATE_USER'   : ['PUT',  '/user', { auth: 'required' }],
    'GET_PROFILE'   : ['GET',  '/profiles/:username', { auth: 'optional' }],
  }
