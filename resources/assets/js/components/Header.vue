<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <router-link class="navbar-brand" to="/">Contest</router-link>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse">
            <div class="offset-md-11">
                <button v-on:click="logout()" class="btn btn-outline-danger" v-if="authenticated">Logout</button>
                <router-link to="/login" class="btn btn-outline-success" v-else>Login</router-link>
            </div>
        </div>
    </nav>
</template>

<script>
    export default {
        props: ['authenticated'],
        methods: {
            logout() {
                axios.post('/api/logout')
                .then(response => {
                    this.$emit("authenticated", false);
                    this.$router.replace({ name: "home" });
                })
                .catch(response => {
                    console.log(response);
                });
            }
        }
    }
</script>