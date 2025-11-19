if Code.ensure_loaded?(Homex) do
  defmodule Soleil.Homex.BatteryCharge do
    use Homex.Entity.Sensor,
      name: "soleil battery charge",
      device_class: "battery",
      unit_of_measurement: "%"

    def handle_timer(entity) do
      battery_info = Soleil.battery_info()
      entity |> set_value(battery_info.state_of_charge)
    end
  end

  defmodule Soleil.Homex.BatteryVoltage do
    use Homex.Entity.Sensor,
      name: "soleil battery voltage",
      device_class: "voltage",
      unit_of_measurement: "V"

    def handle_timer(entity) do
      battery_info = Soleil.battery_info()
      entity |> set_value(battery_info.voltage)
    end
  end

  defmodule Soleil.Homex.BatteryCurrent do
    use Homex.Entity.Sensor,
      name: "soleil battery current",
      device_class: "current",
      unit_of_measurement: "A"

    def handle_timer(entity) do
      battery_info = Soleil.battery_info()
      entity |> set_value(battery_info.current)
    end
  end

  defmodule Soleil.Homex.BatteryTemperature do
    use Homex.Entity.Sensor,
      name: "soleil battery temperature",
      device_class: "temperature",
      unit_of_measurement: "°C"

    def handle_timer(entity) do
      battery_info = Soleil.battery_info()
      entity |> set_value(battery_info.temperature)
    end
  end

  defmodule Soleil.Homex.Power do
    use Homex.Entity.Switch,
      name: "soleil power off"

    def handle_init(entity) do
      entity |> set_on()
    end

    def handle_off(entity) do
      Soleil.power_off()
      entity
    end
  end
end
