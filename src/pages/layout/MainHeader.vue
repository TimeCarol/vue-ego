<template>
    <Header>
        <Menu mode="horizontal" theme="dark" active-name="1">
            <div class="layout-title">易购后台商城系统</div>
            <div class="layout-nav">
                <MenuItem name="1" style="float: right">
                    <Icon type="md-contact" />
                    Admin
                </MenuItem>
            </div>
        </Menu>
    </Header>
</template>

<script>
    export default {
        name: "MainHeader"
    }
</script>

<style scoped>
    .layout-title{
        width: 200px;
        height: 30px;
        color: white;
        font-size: 18px;
        position: relative;
        left: 20px;
    }
    .layout-nav{
        width: 200px;
        float: right;
        position: relative;
        top: -30px;
        right: 20px;
    }
</style>