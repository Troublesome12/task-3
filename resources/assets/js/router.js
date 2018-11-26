import Home from './components/Home'
import Login from './components/Auth/Login'
import Dashboard from './components/Dashboard'

export const routes = [
	{
		path: '/',
		name: 'home',
		component: Home,
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
	},
	{
		path: '/dashboard',
	 	name: 'dashboard',
		component: Dashboard,
	},
]