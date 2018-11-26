<template>
    <main class="login-form">
        <div class="cotainer">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Login</div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                <div class="col-md-6">
                                    <input type="email" v-model="input.email" class="form-control" placeholder="Email" required autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input type="password" v-model="input.password" class="form-control" placeholder="Password" required>
                                </div>
                            </div>
                            
                            <div class="col-md-10 text-md-right">
                                <button class="btn btn-primary" v-on:click="login()">Login</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<script>
    export default {
        name: 'login',
        props: ['authenticated'],
        data: function () {
            return {
                input: {
                    email: null,
                    password: null
                }
            }
        },
        methods: {
            login() {
                axios.post('/api/login', this.input)
                .then(response => {
                    if(response.data) {
                        this.$emit("authenticated", response.data);
                        this.$router.replace({ name: "dashboard" });
                    } else {
                        alert('sorry! the credential didn\'t match');
                    }
                })
                .catch(response => {
                    console.log(response);
                });
            }
        }
    }
</script>

<style scoped>
    .container {
        padding: 0;
        margin-top: 100px;
    }
</style>