<template>
<div>
  <div class="row">
    <div class="col s10 m11">
      <input class="form-control" placeholder="add your task!">
    </div>
    <div class="col s2 m1">
      <div class="btn-floating waves-effect waves-light red">
        <i class="material-icons">add</i>
      </div>
    </div>
  </div>
  <div>
    <ul class="collection">
      <li v-for="task in tasks" v-if="!task.is_done" v-bind:id="'row_task_' + task.id" class="collection-item">
        <input type="checkbox" v-bind:id="'task_' + task.id">
        <label v-bind:for="'task_' + task.id">{{ task.name }}</label>
      </li>
    </ul>
  </div>
    <div class="btn">Display finished tasks</div>
    <div id="finished-tasks" class="display_none">
      <ul class="collection">
      <li v-for="task in tasks" v-if="task.is_done" v-bind:id="'row_task_' + task.id" class="collection-item">
        <input type="checkbox" v-bind:id="'task_' + task.id" checked="checked">
        <label v-bind:for="'task_' + task.id">{{ task.name }}</label>
      </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
    data: () => {
        return {
            tasks: [],
            newTask: ''
        }
    },
    mounted: () => {
        this.fetchTasks();
    },
    methods: {
        fetchTasks: () => {
            axios.get('/api/tasks').then((response) => {
                for ( task of response.data.tasks ) {
                    this.tasks.push(task)
                }
            }, (error) => {
                console.log(error)
            });
        },
    },
  }
</script>
