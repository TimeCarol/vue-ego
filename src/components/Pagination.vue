<template>
    <div style="text-align: center;padding-top: 40px">
        <Page :total="total" :page-size="pageSize" show-total show-elevator @on-change="changePage" />
    </div>
</template>

<script>
    export default {
        name: "Pagination",
        props: {
            total: {
                type: Number,
                default: 100
            },
            pageSize: {
                type: Number,
                default: 10
            }
        },
        methods: {
            changePage(page) {
                this.$emit('changePage', page);
            }
        }
    }
</script>

<style scoped>

</style>