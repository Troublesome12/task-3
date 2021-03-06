require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import {routes} from './router'
import MainApp from './components/MainApp.vue'

Vue.use(VueRouter)
Vue.use(Vuex)

const router = new VueRouter({routes});
const app = new Vue({
    el: '#app',
    router,
    components: {
    	MainApp
    }
});
