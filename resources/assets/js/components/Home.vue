<template>
    <div class="row">
        <div class="col-sm-4">
            <h2 class="text-center">Contest List</h2><hr>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th class="text-center"><i class="fa fa-cog"></i></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="contest, index in contests">
                        <td>{{ index + 1 }}</td>
                        <td>{{ contest.name }}</td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-outline-primary" title="Team List" v-on:click="fetchTeams(contest.id)">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="col-sm-4" v-show="showTeamList">
            <h2 class="text-center">Team List</h2><hr>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th class="text-center"><i class="fa fa-cog"></i></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="team, index in teams">
                        <td>{{ index + 1 }}</td>
                        <td>{{ team.name }}</td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-outline-primary" title="Player List" v-on:click="fetchPlayers(team.id)">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="col-sm-4" v-show="showPlayerList">
            <h2 class="text-center">Player List</h2><hr>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="player, index in players">
                        <td>{{ index + 1 }}</td>
                        <td>{{ player.name }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'home',
        data: function () {
            return {
                contests: [],
                teams: [],
                players: [],
                showTeamList: false,
                showPlayerList: false,
            }
        },
        created : function() {
            var app = this;
        },
        mounted() {
            this.fetchContests();
        },
        methods: {
            fetchContests: function() {
                axios.get('/api/contests')
                .then(response => {
                    this.contests = response.data;
                })
                .catch(response => {
                    console.log(response);
                }); 
            },
            fetchTeams: function(contest_id) {
                this.showPlayerList = false;
                axios.get('/api/teams/'+contest_id)
                .then(response => {
                    this.teams = response.data;
                    this.showTeamList = true;
                })
                .catch(response => {
                    console.log(response);
                }); 
            },
            fetchPlayers: function(team_id) {
                axios.get('/api/players/'+team_id)
                .then(response => {
                    this.players = response.data;
                    this.showPlayerList = true;
                })
                .catch(response => {
                    console.log(response);
                    alert("Could not load companies");
                }); 
            }
        }
    }
</script>
<style scoped>
    .container {
        padding: 0;
    }
    h2 {
        margin-top: 20px;
    }
</style>