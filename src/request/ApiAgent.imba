export class ApiAgent
  prop root default:'https://conduit.productionready.io/api'
  prop endpoints default: {
    'LIST_ARTICLES' : ['GET',  '/articles'],
    'FEED_ARTICLES' : ['GET',  '/articles/feed', { auth: true }],
    'CREATE_ARTICLE': ['POST', '/articles', { auth: true }],
    'LIST_TAGS'     : ['GET',  '/tags'],
    'REGISTER_USER' : ['POST', '/users'],
    'LOGIN_USER'    : ['POST', '/users/login'],
    'CURRENT_USER'  : ['GET',  '/user', { auth: true }],
    'UPDATE_USER'   : ['PUT',  '/user', { auth: true }],
  }
