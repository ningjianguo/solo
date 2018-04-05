/*
 * Copyright (c) 2010-2018, b3log.org & hacpai.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.b3log.solo.cache;

import org.b3log.latke.Keys;
import org.b3log.latke.cache.Cache;
import org.b3log.latke.cache.CacheFactory;
import org.b3log.latke.ioc.inject.Named;
import org.b3log.latke.ioc.inject.Singleton;
import org.b3log.solo.model.Option;
import org.b3log.solo.util.JSONs;
import org.json.JSONObject;

/**
 * Option cache.
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.0.0.0, Jul 16, 2017
 * @since 2.3.0
 */
@Named
@Singleton
public class OptionCache {

    /**
     * Option cache.
     */
    private Cache CACHE = CacheFactory.getCache(Option.OPTIONS);

    /**
     * Gets an option by the specified option id.
     *
     * @param id the specified option id
     * @return option, returns {@code null} if not found
     */
    public JSONObject getOption(final String id) {
        final JSONObject option = CACHE.get(id);
        if (null == option) {
            return null;
        }

        return JSONs.clone(option);
    }

    /**
     * Adds or updates the specified option.
     *
     * @param option the specified option
     */
    public void putOption(final JSONObject option) {
        CACHE.put(option.optString(Keys.OBJECT_ID), JSONs.clone(option));
    }

    /**
     * Removes an option by the specified option id.
     *
     * @param id the specified option id
     */
    public void removeOption(final String id) {
        CACHE.remove(id);
    }
}
