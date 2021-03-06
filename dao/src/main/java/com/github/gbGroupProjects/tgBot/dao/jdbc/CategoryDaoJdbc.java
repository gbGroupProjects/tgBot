package com.github.gbGroupProjects.tgBot.dao.jdbc;

import com.github.gbGroupProjects.tgBot.dao.CategoryDao;
import com.github.gbGroupProjects.tgBot.model.EventCategory;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CategoryDaoJdbc implements CategoryDao {

    private String sqlAllCategories = "SELECT c.category_id, c.category_name " +
            "FROM category c ORDER BY c.category_id";
    private String sqlCreateNewCategory = "INSERT INTO category(category_id, category_name) " +
            "     VALUES (:categoryId, :categoryName)";
    private String sqlCheckUniqueCategoryName = "SELECT count(c.category_name) " +
            "       FROM category c WHERE lower(c.category_name) = lower(:categoryName)";
    private String sqlCountOfCategories = "SELECT count(*) FROM category";
    // todo make sql commands in properties file

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public CategoryDaoJdbc(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    public List<EventCategory> findAllCategories() {
        return namedParameterJdbcTemplate.query(sqlAllCategories, new CategoryRowMapper());
    }

    @Override
    public Integer addNewCategory(EventCategory category) {
        Map<String, Object> paramsOfSql = new HashMap<>();
        paramsOfSql.put("categoryName", category.getCategoryName());
        paramsOfSql.put("categoryId", category.getCategoryId());

        SqlParameterSource sqlParameterSource = new MapSqlParameterSource(paramsOfSql);
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sqlCreateNewCategory, sqlParameterSource, keyHolder);
        return (Integer) keyHolder.getKey();
    }

    @Override
    public boolean isCategoryUnique(String categoryName) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("categoryName", categoryName);
        try {
            return namedParameterJdbcTemplate.queryForObject(sqlCheckUniqueCategoryName, sqlParameterSource, Integer.class) == 0;
        } catch (NullPointerException d) {
            return false;
        }
    }

    @Override
    public Integer countOfCategories() {
        return namedParameterJdbcTemplate.queryForObject(sqlCountOfCategories, new MapSqlParameterSource(), Integer.class);
    }

    private class CategoryRowMapper implements RowMapper<EventCategory> {
        @Override
        public EventCategory mapRow(ResultSet resultSet, int i) throws SQLException {
            EventCategory category = new EventCategory();
            category.setCategoryId(resultSet.getInt("category_id"));
            category.setCategoryName(resultSet.getString("category_name"));
            return category;
        }
    }
}