import 'imba-router'

import {Header} from './layout/Header.imba'
import {Footer} from './layout/Footer.imba'

import {Home} from './pages/Home.imba'
import {LoginRegister} from './pages/LoginRegister.imba'
import {CreateEditArticle} from './pages/CreateEditArticle.imba'
import {Article} from './pages/Article.imba'
import {Profile} from './pages/Profile.imba'
import {Settings} from './pages/Settings.imba'

import {Auth} from './request/Auth.imba'

tag App
	def build
		Auth.tryLogin

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