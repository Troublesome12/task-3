<template>
    <div id="main">
        <app-header v-bind:authenticated="authenticated" v-on:authenticated="setAuthentication($event)"></app-header>
        <div class="container">
            <router-view v-bind:authenticated="authenticated" v-on:authenticated="setAuthentication($event)"></router-view>
        </div>
    </div>
</template>

<script>
    import Header from './Header.vue'
    
    export default {
        name: 'main-app',
        data() {
            return {
                authenticated: false,
                user: []
            }
        },
        components: {
            'app-header': Header
        },
        created() {
            if(!this.authenticated) {
                axios.get('/api/checkLoggedInUser')
                .then(response => {
                    if(response.data) {
                        this.setAuthentication(response.data);
                    }
                })
                .catch(response => {
                    console.log(response);
                });
            }
        },
        methods: {
            setAuthentication: function(user) {
                if(!user) 
                    this.authenticated = false;
                else {
                    this.user = user;
                    this.authenticated = true;
                }
            }
        }
    }
</script>