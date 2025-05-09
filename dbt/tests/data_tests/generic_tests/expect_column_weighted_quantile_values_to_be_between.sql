{% test expect_column_weighted_quantile_values_to_be_between(model, column_name,
                                                                    quantile,
                                                                    weight_column,
                                                                    min_value=None,
                                                                    max_value=None,
                                                                    group_by=None,
                                                                    row_condition=None,
                                                                    strictly=False
                                                                    ) %}
{% set expression %}
({{ weighted_quantile(model, column_name, weight_column, quantile, row_condition) }})
{% endset %}
{{ dbt_expectations.expression_between(model,
                                        expression=expression,
                                        min_value=min_value,
                                        max_value=max_value,
                                        group_by_columns=group_by,
                                        row_condition=row_condition,
                                        strictly=strictly
                                        ) }}
{% endtest %}
