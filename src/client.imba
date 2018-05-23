import 'imba-router'

import {Header} from './layout/Header.imba'
import {Footer} from './layout/Footer.imba'

import {Home} from './pages/Home.imba'
import {LoginRegister} from './pages/LoginRegister.imba'
import {CreateEditArticle} from './pages/CreateEditArticle.imba'
import {Article} from './pages/Article.imba'
import {Profile} from './pages/Profile.imba'
import {Settings} from './pages/Settings.imba'

import {Connect} from './core/Connect.imba'

tag App
	def build
		if window:localStorage:_token
			const data = await Connect.fetch 'CURRENT_USER'
			if data:user 
				Connect.setAuth data:user

	def render
		<self>
			<Header>
			<Home route='/'>
			<LoginRegister route='/login'>
			<LoginRegister route='/register'>
			<CreateEditArticle route='/editor'>
			<CreateEditArticle route='/editor/:slug'>
			<Article route='/article/:slug'>
			<Profile route='/profile/:username'>
			<Settings route='/settings'>
			<Footer>
			
Imba.mount <App>