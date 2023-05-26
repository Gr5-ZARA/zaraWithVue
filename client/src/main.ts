
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import {ContextProvider} from './views/Context.vue'

const app = createApp(App)

app.use(router)

ContextProvider(app).mount('#app')
