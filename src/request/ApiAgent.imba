export class ApiAgent
  prop root default:'https://conduit.productionready.io/api'
  prop endpoints default: {
    'LIST_ARTICLES'     : ['GET',    '/articles', { auth: 'optional' }],
    'FEED_ARTICLES'     : ['GET',    '/articles/feed', { auth: 'required' }],
    'CREATE_ARTICLE'    : ['POST',   '/articles', { auth: 'required' }],
    'FAVORITE_ARTICLE'  : ['POST',   '/articles/:slug/favorite', { auth: 'required' }],
    'UNFAVORITE_ARTICLE': ['DELETE', '/articles/:slug/favorite', { auth: 'required' }],
    'LIST_TAGS'         : ['GET',    '/tags'],
    'REGISTER_USER'     : ['POST',   '/users'],
    'LOGIN_USER'        : ['POST',   '/users/login'],
    'CURRENT_USER'      : ['GET',    '/user', { auth: 'required' }],
    'UPDATE_USER'       : ['PUT',    '/user', { auth: 'required' }],
    'FOLLOW_USER'       : ['POST',   '/profiles/:username/follow', { auth: 'required' }],
    'UNFOLLOW_USER'     : ['DELETE', '/profiles/:username/follow', { auth: 'required' }],
    'GET_PROFILE'       : ['GET',    '/profiles/:username', { auth: 'optional' }],
  }
