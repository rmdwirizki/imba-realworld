import {Router} from 'imba-router'

import {Auth} from './request/Auth.imba'

import {Header} from './layout/Header.imba'
import {Footer} from './layout/Footer.imba'

import {Home} from './pages/Home.imba'
import {LoginRegister} from './pages/LoginRegister.imba'
import {CreateEditArticle} from './pages/CreateEditArticle.imba'
import {Article} from './pages/Article.imba'
import {Profile} from './pages/Profile.imba'
import {Settings} from './pages/Settings.imba'

# Add private method to every tag element
import './global/Extend.imba'

tag App
	prop isAuthComplete default: false

	def build
		setRouter Router.new {mode: 'hash'}
		Auth.tryLogin do
			@isAuthComplete = true
			Imba.commit

	def render
		<self>
			if !isAuthComplete
				<object.self-centered data=(asset('loader.svg')) type="image/svg+xml">
			else
				<Header>
				<Home route='/'>
				<LoginRegister route='/login'>
				<LoginRegister route='/register'>
				<CreateEditArticle route='/editer' need-auth=true>
				<CreateEditArticle route='/editor/:slug' need-auth=true>
				<Article route='/article/:slug'>
				<Profile route='/profile/:username'>
				<Settings route='/settings' need-auth=true>
				<Footer>

Imba.mount <App>