({
    fetchData: function (component, event, helper) {
        var action = component.get("c.exchangeObject");
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                component.set('v.data', data);
            }
        });
        $A.enqueueAction(action);
    },
})