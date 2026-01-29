{% macro weekday(x)%}

case when dayname(to_timestamp({{x}})) in ('Sat', 'Sun')
        then 'Weekend'
        else 'Business day'
        end

{% endmacro %}  