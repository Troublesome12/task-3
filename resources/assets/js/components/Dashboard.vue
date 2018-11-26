<template>
    
    <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-header">User Info</div>
                <div class="card-body">
                    Name : {{ this.user.name }} <br>
                    Email : {{ this.user.email }} <br>
                    Type : {{ this.user.user_type }} <br>
                </div>
            </div>
        </div>

        <div class="col-sm-8" v-if="this.user.user_type == 'contest_maker'">
            <div class="card" v-for="contest in contests">
                <div class="card-header">{{ contest.name }}</div>
                <div class="card-body">
                    <ul v-for="team in contest.teams">
                        <li>{{ team.name }}</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-8" v-if="this.user.user_type == 'team_owner'">
            <div class="card" v-for="team in teams">
                <div class="card-header">{{ team.name }}</div>
                <div class="card-body">
                    <ul v-for="player in team.players">
                        <li>{{ player.name }}</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-8" v-if="this.user.user_type == 'player'">
            <div class="card" v-for="player in players">
                <div class="card-body">
                    You are in {{ player.team_name }} on {{ player.contest_name }} 
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'dashboard',
        props: ['authenticated'],
        data() {
            return {
                user: null,
                contests: [],
                teams: [],
                players: []
            };
        },
        created() {
            
        },
        mounted() {
            this.fetchUserInfo();
        },
        methods: {
            fetchUserInfo: function() {
                axios.get('/api/dashboard/user')
                .then(response => {
                    this.user = response.data;

                    if(this.user.user_type == 'contest_maker') {
                        this.fetchContests();
                    } else if(this.user.user_type == 'team_owner') {
                        this.fetchTeams();
                    } else 
                        this.fetchPlayers();
                })
                .catch(response => {
                    console.log(response);
                }); 
            },
            fetchContests: function() {
                axios.get('/api/dashboard/contests')
                .then(response => {
                    this.contests = response.data;
                })
                .catch(response => {
                    console.log(response);
                }); 
            },
            fetchTeams: function() {
                axios.get('/api/dashboard/teams')
                .then(response => {
                    this.teams = response.data;
                })
                .catch(response => {
                    console.log(response);
                }); 
            },
            fetchPlayers: function() {
                axios.get('/api/dashboard/player')
                .then(response => {
                    this.players = response.data;
                    console.log(this.players);
                })
                .catch(response => {
                    console.log(response);
                }); 
            }
        }
    }
</script>

<style scoped>
    .row {
        margin-top: 20px;
    }
</style>