### Features
- A loadingbar that will execute a callback after a certain amount of time.

## Installation
- Add this to your `server.cfg`:

```
start erp-progbar
```

## Example

* This will make a progressbar with the title ``Taking bandage...`` and it will execute ``SetEntityHealth`` after ``10000ms``

```lua
    exports["erp-progbar"]:StartDelayedFunction("Taking bandage...", 10000, function()
        SetEntityHealth(PlayerPedId(), GetPedMaxHealth(PlayerPedId()))
    end)
```

![Loadingbar](https://godhatesfags.church/dCiAZiBoMpZRfVx.png)


