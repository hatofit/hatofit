<script lang="ts" setup>
useHead({
  htmlAttrs: {
    lang: 'en'
  },
  link: [
    {
      rel: 'icon',
      type: 'image/png',
      href: '/favicon.ico'
    }
  ]
})

const messages = [
  `Uncaught NotFoundError: Failed to execute 'insertBefore' on 'Node': The node before which the new node is to be inserted is not a child of this node.`, // chromium based
  `NotFoundError: The object can not be found here.`, // safari
  `TypeError: Failed to execute 'insertBefore'`
]
if (typeof window !== 'undefined') {
  window.addEventListener('error', (ev) => {
    if (messages.includes(ev.message)) {
      ev.preventDefault()
      window.location.reload()
    }
  })
}
</script>

<template>
  <Html lang="en">
    <NuxtLoadingIndicator :height="5" :throttle="0" color="red" />
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
    <UNotifications />
  </Html>
</template>
