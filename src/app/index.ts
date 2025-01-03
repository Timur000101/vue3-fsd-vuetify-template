import { registerPlugins } from '@/shared/plugins'
import { createApp } from 'vue'
import App from './App.vue'

import router from './router'

const app = createApp(App)

registerPlugins(app)
app.use(router)

app.mount('#app')
