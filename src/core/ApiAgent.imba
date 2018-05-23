export class ApiAgent
  prop root default:'https://conduit.productionready.io/api'
  prop endpoints default: {
    'LIST_ARTICLES': ['GET',  '/articles'],
    'LIST_TAGS'    : ['GET',  '/tags'],
    'CURRENT_USER' : ['GET',  '/user', { auth: true }],
    'REGISTER_USER': ['POST', '/users'],
    'LOGIN_USER'   : ['POST', '/users/login'],
  }
